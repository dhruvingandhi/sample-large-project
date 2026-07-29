# Explore: explore_2775
# Auto-generated LookML Explore File

include: "/views/domain_26/view_08326.view.lkml"
include: "/views/domain_28/view_08328.view.lkml"
include: "/views/domain_29/view_08329.view.lkml"
include: "/views/domain_30/view_08330.view.lkml"

explore: explore_2775 {
  label: "Explore Explore 2775"
  description: "Comprehensive analytics explore joining base view_08326 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08326
  
  always_filter: {
    filters: [view_08326.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08326.created_at_date: "7 days"]
    unless: [view_08326.id, view_08326.status]
  }

  join: view_08328 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08326.user_id} = ${view_08328.id} ;;
    required_joins: []
  }

  join: view_08329 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08326.account_id} = ${view_08329.account_id} ;;
    required_joins: [view_08328]
  }

  join: view_08330 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08326.category} = ${view_08330.category} ;;
  }

  access_filter: {
    field: view_08326.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08326.is_deleted} = false ;;
}
