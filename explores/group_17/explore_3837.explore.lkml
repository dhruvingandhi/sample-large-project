# Explore: explore_3837
# Auto-generated LookML Explore File

include: "/views/domain_12/view_11512.view.lkml"
include: "/views/domain_14/view_11514.view.lkml"
include: "/views/domain_15/view_11515.view.lkml"
include: "/views/domain_16/view_11516.view.lkml"

explore: explore_3837 {
  label: "Explore Explore 3837"
  description: "Comprehensive analytics explore joining base view_11512 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11512
  
  always_filter: {
    filters: [view_11512.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11512.created_at_date: "7 days"]
    unless: [view_11512.id, view_11512.status]
  }

  join: view_11514 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11512.user_id} = ${view_11514.id} ;;
    required_joins: []
  }

  join: view_11515 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11512.account_id} = ${view_11515.account_id} ;;
    required_joins: [view_11514]
  }

  join: view_11516 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11512.category} = ${view_11516.category} ;;
  }

  access_filter: {
    field: view_11512.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11512.is_deleted} = false ;;
}
