# Explore: explore_1329
# Auto-generated LookML Explore File

include: "/views/domain_38/view_03988.view.lkml"
include: "/views/domain_40/view_03990.view.lkml"
include: "/views/domain_41/view_03991.view.lkml"
include: "/views/domain_42/view_03992.view.lkml"

explore: explore_1329 {
  label: "Explore Explore 1329"
  description: "Comprehensive analytics explore joining base view_03988 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03988
  
  always_filter: {
    filters: [view_03988.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03988.created_at_date: "7 days"]
    unless: [view_03988.id, view_03988.status]
  }

  join: view_03990 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03988.user_id} = ${view_03990.id} ;;
    required_joins: []
  }

  join: view_03991 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03988.account_id} = ${view_03991.account_id} ;;
    required_joins: [view_03990]
  }

  join: view_03992 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03988.category} = ${view_03992.category} ;;
  }

  access_filter: {
    field: view_03988.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03988.is_deleted} = false ;;
}
