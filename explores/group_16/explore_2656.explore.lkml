# Explore: explore_2656
# Auto-generated LookML Explore File

include: "/views/domain_19/view_07969.view.lkml"
include: "/views/domain_21/view_07971.view.lkml"
include: "/views/domain_22/view_07972.view.lkml"
include: "/views/domain_23/view_07973.view.lkml"

explore: explore_2656 {
  label: "Explore Explore 2656"
  description: "Comprehensive analytics explore joining base view_07969 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07969
  
  always_filter: {
    filters: [view_07969.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07969.created_at_date: "7 days"]
    unless: [view_07969.id, view_07969.status]
  }

  join: view_07971 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07969.user_id} = ${view_07971.id} ;;
    required_joins: []
  }

  join: view_07972 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07969.account_id} = ${view_07972.account_id} ;;
    required_joins: [view_07971]
  }

  join: view_07973 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07969.category} = ${view_07973.category} ;;
  }

  access_filter: {
    field: view_07969.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07969.is_deleted} = false ;;
}
