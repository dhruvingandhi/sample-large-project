# Explore: explore_0321
# Auto-generated LookML Explore File

include: "/views/domain_14/view_00964.view.lkml"
include: "/views/domain_16/view_00966.view.lkml"
include: "/views/domain_17/view_00967.view.lkml"
include: "/views/domain_18/view_00968.view.lkml"

explore: explore_0321 {
  label: "Explore Explore 0321"
  description: "Comprehensive analytics explore joining base view_00964 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00964
  
  always_filter: {
    filters: [view_00964.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00964.created_at_date: "7 days"]
    unless: [view_00964.id, view_00964.status]
  }

  join: view_00966 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00964.user_id} = ${view_00966.id} ;;
    required_joins: []
  }

  join: view_00967 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00964.account_id} = ${view_00967.account_id} ;;
    required_joins: [view_00966]
  }

  join: view_00968 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00964.category} = ${view_00968.category} ;;
  }

  access_filter: {
    field: view_00964.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00964.is_deleted} = false ;;
}
