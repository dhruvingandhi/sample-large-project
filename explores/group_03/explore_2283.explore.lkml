# Explore: explore_2283
# Auto-generated LookML Explore File

include: "/views/domain_50/view_06850.view.lkml"
include: "/views/domain_02/view_06852.view.lkml"
include: "/views/domain_03/view_06853.view.lkml"
include: "/views/domain_04/view_06854.view.lkml"

explore: explore_2283 {
  label: "Explore Explore 2283"
  description: "Comprehensive analytics explore joining base view_06850 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06850
  
  always_filter: {
    filters: [view_06850.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06850.created_at_date: "7 days"]
    unless: [view_06850.id, view_06850.status]
  }

  join: view_06852 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06850.user_id} = ${view_06852.id} ;;
    required_joins: []
  }

  join: view_06853 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06850.account_id} = ${view_06853.account_id} ;;
    required_joins: [view_06852]
  }

  join: view_06854 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06850.category} = ${view_06854.category} ;;
  }

  access_filter: {
    field: view_06850.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06850.is_deleted} = false ;;
}
