# Explore: explore_1775
# Auto-generated LookML Explore File

include: "/views/domain_26/view_05326.view.lkml"
include: "/views/domain_28/view_05328.view.lkml"
include: "/views/domain_29/view_05329.view.lkml"
include: "/views/domain_30/view_05330.view.lkml"

explore: explore_1775 {
  label: "Explore Explore 1775"
  description: "Comprehensive analytics explore joining base view_05326 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05326
  
  always_filter: {
    filters: [view_05326.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05326.created_at_date: "7 days"]
    unless: [view_05326.id, view_05326.status]
  }

  join: view_05328 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05326.user_id} = ${view_05328.id} ;;
    required_joins: []
  }

  join: view_05329 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05326.account_id} = ${view_05329.account_id} ;;
    required_joins: [view_05328]
  }

  join: view_05330 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05326.category} = ${view_05330.category} ;;
  }

  access_filter: {
    field: view_05326.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05326.is_deleted} = false ;;
}
