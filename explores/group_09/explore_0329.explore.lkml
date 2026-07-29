# Explore: explore_0329
# Auto-generated LookML Explore File

include: "/views/domain_38/view_00988.view.lkml"
include: "/views/domain_40/view_00990.view.lkml"
include: "/views/domain_41/view_00991.view.lkml"
include: "/views/domain_42/view_00992.view.lkml"

explore: explore_0329 {
  label: "Explore Explore 0329"
  description: "Comprehensive analytics explore joining base view_00988 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00988
  
  always_filter: {
    filters: [view_00988.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00988.created_at_date: "7 days"]
    unless: [view_00988.id, view_00988.status]
  }

  join: view_00990 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00988.user_id} = ${view_00990.id} ;;
    required_joins: []
  }

  join: view_00991 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00988.account_id} = ${view_00991.account_id} ;;
    required_joins: [view_00990]
  }

  join: view_00992 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00988.category} = ${view_00992.category} ;;
  }

  access_filter: {
    field: view_00988.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00988.is_deleted} = false ;;
}
