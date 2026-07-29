# Explore: explore_1651
# Auto-generated LookML Explore File

include: "/views/domain_04/view_04954.view.lkml"
include: "/views/domain_06/view_04956.view.lkml"
include: "/views/domain_07/view_04957.view.lkml"
include: "/views/domain_08/view_04958.view.lkml"

explore: explore_1651 {
  label: "Explore Explore 1651"
  description: "Comprehensive analytics explore joining base view_04954 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04954
  
  always_filter: {
    filters: [view_04954.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04954.created_at_date: "7 days"]
    unless: [view_04954.id, view_04954.status]
  }

  join: view_04956 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04954.user_id} = ${view_04956.id} ;;
    required_joins: []
  }

  join: view_04957 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04954.account_id} = ${view_04957.account_id} ;;
    required_joins: [view_04956]
  }

  join: view_04958 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04954.category} = ${view_04958.category} ;;
  }

  access_filter: {
    field: view_04954.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04954.is_deleted} = false ;;
}
