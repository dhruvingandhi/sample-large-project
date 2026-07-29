# Explore: explore_3652
# Auto-generated LookML Explore File

include: "/views/domain_07/view_10957.view.lkml"
include: "/views/domain_09/view_10959.view.lkml"
include: "/views/domain_10/view_10960.view.lkml"
include: "/views/domain_11/view_10961.view.lkml"

explore: explore_3652 {
  label: "Explore Explore 3652"
  description: "Comprehensive analytics explore joining base view_10957 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10957
  
  always_filter: {
    filters: [view_10957.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10957.created_at_date: "7 days"]
    unless: [view_10957.id, view_10957.status]
  }

  join: view_10959 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10957.user_id} = ${view_10959.id} ;;
    required_joins: []
  }

  join: view_10960 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10957.account_id} = ${view_10960.account_id} ;;
    required_joins: [view_10959]
  }

  join: view_10961 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10957.category} = ${view_10961.category} ;;
  }

  access_filter: {
    field: view_10957.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10957.is_deleted} = false ;;
}
