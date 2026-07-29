# Explore: explore_1155
# Auto-generated LookML Explore File

include: "/views/domain_16/view_03466.view.lkml"
include: "/views/domain_18/view_03468.view.lkml"
include: "/views/domain_19/view_03469.view.lkml"
include: "/views/domain_20/view_03470.view.lkml"

explore: explore_1155 {
  label: "Explore Explore 1155"
  description: "Comprehensive analytics explore joining base view_03466 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03466
  
  always_filter: {
    filters: [view_03466.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03466.created_at_date: "7 days"]
    unless: [view_03466.id, view_03466.status]
  }

  join: view_03468 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03466.user_id} = ${view_03468.id} ;;
    required_joins: []
  }

  join: view_03469 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03466.account_id} = ${view_03469.account_id} ;;
    required_joins: [view_03468]
  }

  join: view_03470 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03466.category} = ${view_03470.category} ;;
  }

  access_filter: {
    field: view_03466.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03466.is_deleted} = false ;;
}
