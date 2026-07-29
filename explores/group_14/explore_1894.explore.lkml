# Explore: explore_1894
# Auto-generated LookML Explore File

include: "/views/domain_33/view_05683.view.lkml"
include: "/views/domain_35/view_05685.view.lkml"
include: "/views/domain_36/view_05686.view.lkml"
include: "/views/domain_37/view_05687.view.lkml"

explore: explore_1894 {
  label: "Explore Explore 1894"
  description: "Comprehensive analytics explore joining base view_05683 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05683
  
  always_filter: {
    filters: [view_05683.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05683.created_at_date: "7 days"]
    unless: [view_05683.id, view_05683.status]
  }

  join: view_05685 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05683.user_id} = ${view_05685.id} ;;
    required_joins: []
  }

  join: view_05686 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05683.account_id} = ${view_05686.account_id} ;;
    required_joins: [view_05685]
  }

  join: view_05687 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05683.category} = ${view_05687.category} ;;
  }

  access_filter: {
    field: view_05683.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05683.is_deleted} = false ;;
}
