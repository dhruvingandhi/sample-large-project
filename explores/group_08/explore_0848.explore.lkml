# Explore: explore_0848
# Auto-generated LookML Explore File

include: "/views/domain_45/view_02545.view.lkml"
include: "/views/domain_47/view_02547.view.lkml"
include: "/views/domain_48/view_02548.view.lkml"
include: "/views/domain_49/view_02549.view.lkml"

explore: explore_0848 {
  label: "Explore Explore 0848"
  description: "Comprehensive analytics explore joining base view_02545 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02545
  
  always_filter: {
    filters: [view_02545.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02545.created_at_date: "7 days"]
    unless: [view_02545.id, view_02545.status]
  }

  join: view_02547 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02545.user_id} = ${view_02547.id} ;;
    required_joins: []
  }

  join: view_02548 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02545.account_id} = ${view_02548.account_id} ;;
    required_joins: [view_02547]
  }

  join: view_02549 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02545.category} = ${view_02549.category} ;;
  }

  access_filter: {
    field: view_02545.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02545.is_deleted} = false ;;
}
