# Explore: explore_3036
# Auto-generated LookML Explore File

include: "/views/domain_09/view_09109.view.lkml"
include: "/views/domain_11/view_09111.view.lkml"
include: "/views/domain_12/view_09112.view.lkml"
include: "/views/domain_13/view_09113.view.lkml"

explore: explore_3036 {
  label: "Explore Explore 3036"
  description: "Comprehensive analytics explore joining base view_09109 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09109
  
  always_filter: {
    filters: [view_09109.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09109.created_at_date: "7 days"]
    unless: [view_09109.id, view_09109.status]
  }

  join: view_09111 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09109.user_id} = ${view_09111.id} ;;
    required_joins: []
  }

  join: view_09112 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09109.account_id} = ${view_09112.account_id} ;;
    required_joins: [view_09111]
  }

  join: view_09113 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09109.category} = ${view_09113.category} ;;
  }

  access_filter: {
    field: view_09109.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09109.is_deleted} = false ;;
}
