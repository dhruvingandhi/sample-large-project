# Explore: explore_2649
# Auto-generated LookML Explore File

include: "/views/domain_48/view_07948.view.lkml"
include: "/views/domain_50/view_07950.view.lkml"
include: "/views/domain_01/view_07951.view.lkml"
include: "/views/domain_02/view_07952.view.lkml"

explore: explore_2649 {
  label: "Explore Explore 2649"
  description: "Comprehensive analytics explore joining base view_07948 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07948
  
  always_filter: {
    filters: [view_07948.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07948.created_at_date: "7 days"]
    unless: [view_07948.id, view_07948.status]
  }

  join: view_07950 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07948.user_id} = ${view_07950.id} ;;
    required_joins: []
  }

  join: view_07951 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07948.account_id} = ${view_07951.account_id} ;;
    required_joins: [view_07950]
  }

  join: view_07952 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07948.category} = ${view_07952.category} ;;
  }

  access_filter: {
    field: view_07948.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07948.is_deleted} = false ;;
}
