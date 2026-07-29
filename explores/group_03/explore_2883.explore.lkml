# Explore: explore_2883
# Auto-generated LookML Explore File

include: "/views/domain_50/view_08650.view.lkml"
include: "/views/domain_02/view_08652.view.lkml"
include: "/views/domain_03/view_08653.view.lkml"
include: "/views/domain_04/view_08654.view.lkml"

explore: explore_2883 {
  label: "Explore Explore 2883"
  description: "Comprehensive analytics explore joining base view_08650 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08650
  
  always_filter: {
    filters: [view_08650.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08650.created_at_date: "7 days"]
    unless: [view_08650.id, view_08650.status]
  }

  join: view_08652 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08650.user_id} = ${view_08652.id} ;;
    required_joins: []
  }

  join: view_08653 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08650.account_id} = ${view_08653.account_id} ;;
    required_joins: [view_08652]
  }

  join: view_08654 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08650.category} = ${view_08654.category} ;;
  }

  access_filter: {
    field: view_08650.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08650.is_deleted} = false ;;
}
