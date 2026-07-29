# Explore: explore_0837
# Auto-generated LookML Explore File

include: "/views/domain_12/view_02512.view.lkml"
include: "/views/domain_14/view_02514.view.lkml"
include: "/views/domain_15/view_02515.view.lkml"
include: "/views/domain_16/view_02516.view.lkml"

explore: explore_0837 {
  label: "Explore Explore 0837"
  description: "Comprehensive analytics explore joining base view_02512 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02512
  
  always_filter: {
    filters: [view_02512.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02512.created_at_date: "7 days"]
    unless: [view_02512.id, view_02512.status]
  }

  join: view_02514 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02512.user_id} = ${view_02514.id} ;;
    required_joins: []
  }

  join: view_02515 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02512.account_id} = ${view_02515.account_id} ;;
    required_joins: [view_02514]
  }

  join: view_02516 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02512.category} = ${view_02516.category} ;;
  }

  access_filter: {
    field: view_02512.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02512.is_deleted} = false ;;
}
