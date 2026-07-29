# Explore: explore_2837
# Auto-generated LookML Explore File

include: "/views/domain_12/view_08512.view.lkml"
include: "/views/domain_14/view_08514.view.lkml"
include: "/views/domain_15/view_08515.view.lkml"
include: "/views/domain_16/view_08516.view.lkml"

explore: explore_2837 {
  label: "Explore Explore 2837"
  description: "Comprehensive analytics explore joining base view_08512 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08512
  
  always_filter: {
    filters: [view_08512.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08512.created_at_date: "7 days"]
    unless: [view_08512.id, view_08512.status]
  }

  join: view_08514 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08512.user_id} = ${view_08514.id} ;;
    required_joins: []
  }

  join: view_08515 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08512.account_id} = ${view_08515.account_id} ;;
    required_joins: [view_08514]
  }

  join: view_08516 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08512.category} = ${view_08516.category} ;;
  }

  access_filter: {
    field: view_08512.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08512.is_deleted} = false ;;
}
