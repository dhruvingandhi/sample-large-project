# Explore: explore_2617
# Auto-generated LookML Explore File

include: "/views/domain_02/view_07852.view.lkml"
include: "/views/domain_04/view_07854.view.lkml"
include: "/views/domain_05/view_07855.view.lkml"
include: "/views/domain_06/view_07856.view.lkml"

explore: explore_2617 {
  label: "Explore Explore 2617"
  description: "Comprehensive analytics explore joining base view_07852 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07852
  
  always_filter: {
    filters: [view_07852.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07852.created_at_date: "7 days"]
    unless: [view_07852.id, view_07852.status]
  }

  join: view_07854 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07852.user_id} = ${view_07854.id} ;;
    required_joins: []
  }

  join: view_07855 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07852.account_id} = ${view_07855.account_id} ;;
    required_joins: [view_07854]
  }

  join: view_07856 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07852.category} = ${view_07856.category} ;;
  }

  access_filter: {
    field: view_07852.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07852.is_deleted} = false ;;
}
