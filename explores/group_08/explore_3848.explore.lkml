# Explore: explore_3848
# Auto-generated LookML Explore File

include: "/views/domain_45/view_11545.view.lkml"
include: "/views/domain_47/view_11547.view.lkml"
include: "/views/domain_48/view_11548.view.lkml"
include: "/views/domain_49/view_11549.view.lkml"

explore: explore_3848 {
  label: "Explore Explore 3848"
  description: "Comprehensive analytics explore joining base view_11545 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11545
  
  always_filter: {
    filters: [view_11545.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11545.created_at_date: "7 days"]
    unless: [view_11545.id, view_11545.status]
  }

  join: view_11547 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11545.user_id} = ${view_11547.id} ;;
    required_joins: []
  }

  join: view_11548 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11545.account_id} = ${view_11548.account_id} ;;
    required_joins: [view_11547]
  }

  join: view_11549 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11545.category} = ${view_11549.category} ;;
  }

  access_filter: {
    field: view_11545.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11545.is_deleted} = false ;;
}
