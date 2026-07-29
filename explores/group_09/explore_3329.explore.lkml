# Explore: explore_3329
# Auto-generated LookML Explore File

include: "/views/domain_38/view_09988.view.lkml"
include: "/views/domain_40/view_09990.view.lkml"
include: "/views/domain_41/view_09991.view.lkml"
include: "/views/domain_42/view_09992.view.lkml"

explore: explore_3329 {
  label: "Explore Explore 3329"
  description: "Comprehensive analytics explore joining base view_09988 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09988
  
  always_filter: {
    filters: [view_09988.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09988.created_at_date: "7 days"]
    unless: [view_09988.id, view_09988.status]
  }

  join: view_09990 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09988.user_id} = ${view_09990.id} ;;
    required_joins: []
  }

  join: view_09991 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09988.account_id} = ${view_09991.account_id} ;;
    required_joins: [view_09990]
  }

  join: view_09992 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09988.category} = ${view_09992.category} ;;
  }

  access_filter: {
    field: view_09988.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09988.is_deleted} = false ;;
}
