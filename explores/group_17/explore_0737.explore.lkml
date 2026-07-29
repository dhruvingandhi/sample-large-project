# Explore: explore_0737
# Auto-generated LookML Explore File

include: "/views/domain_12/view_02212.view.lkml"
include: "/views/domain_14/view_02214.view.lkml"
include: "/views/domain_15/view_02215.view.lkml"
include: "/views/domain_16/view_02216.view.lkml"

explore: explore_0737 {
  label: "Explore Explore 0737"
  description: "Comprehensive analytics explore joining base view_02212 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02212
  
  always_filter: {
    filters: [view_02212.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02212.created_at_date: "7 days"]
    unless: [view_02212.id, view_02212.status]
  }

  join: view_02214 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02212.user_id} = ${view_02214.id} ;;
    required_joins: []
  }

  join: view_02215 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02212.account_id} = ${view_02215.account_id} ;;
    required_joins: [view_02214]
  }

  join: view_02216 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02212.category} = ${view_02216.category} ;;
  }

  access_filter: {
    field: view_02212.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02212.is_deleted} = false ;;
}
