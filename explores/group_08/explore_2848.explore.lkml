# Explore: explore_2848
# Auto-generated LookML Explore File

include: "/views/domain_45/view_08545.view.lkml"
include: "/views/domain_47/view_08547.view.lkml"
include: "/views/domain_48/view_08548.view.lkml"
include: "/views/domain_49/view_08549.view.lkml"

explore: explore_2848 {
  label: "Explore Explore 2848"
  description: "Comprehensive analytics explore joining base view_08545 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08545
  
  always_filter: {
    filters: [view_08545.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08545.created_at_date: "7 days"]
    unless: [view_08545.id, view_08545.status]
  }

  join: view_08547 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08545.user_id} = ${view_08547.id} ;;
    required_joins: []
  }

  join: view_08548 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08545.account_id} = ${view_08548.account_id} ;;
    required_joins: [view_08547]
  }

  join: view_08549 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08545.category} = ${view_08549.category} ;;
  }

  access_filter: {
    field: view_08545.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08545.is_deleted} = false ;;
}
