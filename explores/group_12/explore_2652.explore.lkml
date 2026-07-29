# Explore: explore_2652
# Auto-generated LookML Explore File

include: "/views/domain_07/view_07957.view.lkml"
include: "/views/domain_09/view_07959.view.lkml"
include: "/views/domain_10/view_07960.view.lkml"
include: "/views/domain_11/view_07961.view.lkml"

explore: explore_2652 {
  label: "Explore Explore 2652"
  description: "Comprehensive analytics explore joining base view_07957 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07957
  
  always_filter: {
    filters: [view_07957.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07957.created_at_date: "7 days"]
    unless: [view_07957.id, view_07957.status]
  }

  join: view_07959 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07957.user_id} = ${view_07959.id} ;;
    required_joins: []
  }

  join: view_07960 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07957.account_id} = ${view_07960.account_id} ;;
    required_joins: [view_07959]
  }

  join: view_07961 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07957.category} = ${view_07961.category} ;;
  }

  access_filter: {
    field: view_07957.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07957.is_deleted} = false ;;
}
