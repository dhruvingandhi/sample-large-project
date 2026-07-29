# Explore: explore_2847
# Auto-generated LookML Explore File

include: "/views/domain_42/view_08542.view.lkml"
include: "/views/domain_44/view_08544.view.lkml"
include: "/views/domain_45/view_08545.view.lkml"
include: "/views/domain_46/view_08546.view.lkml"

explore: explore_2847 {
  label: "Explore Explore 2847"
  description: "Comprehensive analytics explore joining base view_08542 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08542
  
  always_filter: {
    filters: [view_08542.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08542.created_at_date: "7 days"]
    unless: [view_08542.id, view_08542.status]
  }

  join: view_08544 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08542.user_id} = ${view_08544.id} ;;
    required_joins: []
  }

  join: view_08545 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08542.account_id} = ${view_08545.account_id} ;;
    required_joins: [view_08544]
  }

  join: view_08546 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08542.category} = ${view_08546.category} ;;
  }

  access_filter: {
    field: view_08542.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08542.is_deleted} = false ;;
}
