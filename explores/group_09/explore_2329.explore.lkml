# Explore: explore_2329
# Auto-generated LookML Explore File

include: "/views/domain_38/view_06988.view.lkml"
include: "/views/domain_40/view_06990.view.lkml"
include: "/views/domain_41/view_06991.view.lkml"
include: "/views/domain_42/view_06992.view.lkml"

explore: explore_2329 {
  label: "Explore Explore 2329"
  description: "Comprehensive analytics explore joining base view_06988 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06988
  
  always_filter: {
    filters: [view_06988.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06988.created_at_date: "7 days"]
    unless: [view_06988.id, view_06988.status]
  }

  join: view_06990 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06988.user_id} = ${view_06990.id} ;;
    required_joins: []
  }

  join: view_06991 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06988.account_id} = ${view_06991.account_id} ;;
    required_joins: [view_06990]
  }

  join: view_06992 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06988.category} = ${view_06992.category} ;;
  }

  access_filter: {
    field: view_06988.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06988.is_deleted} = false ;;
}
