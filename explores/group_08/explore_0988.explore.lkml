# Explore: explore_0988
# Auto-generated LookML Explore File

include: "/views/domain_15/view_02965.view.lkml"
include: "/views/domain_17/view_02967.view.lkml"
include: "/views/domain_18/view_02968.view.lkml"
include: "/views/domain_19/view_02969.view.lkml"

explore: explore_0988 {
  label: "Explore Explore 0988"
  description: "Comprehensive analytics explore joining base view_02965 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02965
  
  always_filter: {
    filters: [view_02965.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02965.created_at_date: "7 days"]
    unless: [view_02965.id, view_02965.status]
  }

  join: view_02967 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02965.user_id} = ${view_02967.id} ;;
    required_joins: []
  }

  join: view_02968 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02965.account_id} = ${view_02968.account_id} ;;
    required_joins: [view_02967]
  }

  join: view_02969 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02965.category} = ${view_02969.category} ;;
  }

  access_filter: {
    field: view_02965.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02965.is_deleted} = false ;;
}
