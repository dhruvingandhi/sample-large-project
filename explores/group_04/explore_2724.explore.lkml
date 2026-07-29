# Explore: explore_2724
# Auto-generated LookML Explore File

include: "/views/domain_23/view_08173.view.lkml"
include: "/views/domain_25/view_08175.view.lkml"
include: "/views/domain_26/view_08176.view.lkml"
include: "/views/domain_27/view_08177.view.lkml"

explore: explore_2724 {
  label: "Explore Explore 2724"
  description: "Comprehensive analytics explore joining base view_08173 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08173
  
  always_filter: {
    filters: [view_08173.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08173.created_at_date: "7 days"]
    unless: [view_08173.id, view_08173.status]
  }

  join: view_08175 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08173.user_id} = ${view_08175.id} ;;
    required_joins: []
  }

  join: view_08176 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08173.account_id} = ${view_08176.account_id} ;;
    required_joins: [view_08175]
  }

  join: view_08177 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08173.category} = ${view_08177.category} ;;
  }

  access_filter: {
    field: view_08173.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08173.is_deleted} = false ;;
}
