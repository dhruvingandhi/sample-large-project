# Explore: explore_1847
# Auto-generated LookML Explore File

include: "/views/domain_42/view_05542.view.lkml"
include: "/views/domain_44/view_05544.view.lkml"
include: "/views/domain_45/view_05545.view.lkml"
include: "/views/domain_46/view_05546.view.lkml"

explore: explore_1847 {
  label: "Explore Explore 1847"
  description: "Comprehensive analytics explore joining base view_05542 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05542
  
  always_filter: {
    filters: [view_05542.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05542.created_at_date: "7 days"]
    unless: [view_05542.id, view_05542.status]
  }

  join: view_05544 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05542.user_id} = ${view_05544.id} ;;
    required_joins: []
  }

  join: view_05545 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05542.account_id} = ${view_05545.account_id} ;;
    required_joins: [view_05544]
  }

  join: view_05546 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05542.category} = ${view_05546.category} ;;
  }

  access_filter: {
    field: view_05542.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05542.is_deleted} = false ;;
}
