# Explore: explore_2155
# Auto-generated LookML Explore File

include: "/views/domain_16/view_06466.view.lkml"
include: "/views/domain_18/view_06468.view.lkml"
include: "/views/domain_19/view_06469.view.lkml"
include: "/views/domain_20/view_06470.view.lkml"

explore: explore_2155 {
  label: "Explore Explore 2155"
  description: "Comprehensive analytics explore joining base view_06466 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06466
  
  always_filter: {
    filters: [view_06466.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06466.created_at_date: "7 days"]
    unless: [view_06466.id, view_06466.status]
  }

  join: view_06468 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06466.user_id} = ${view_06468.id} ;;
    required_joins: []
  }

  join: view_06469 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06466.account_id} = ${view_06469.account_id} ;;
    required_joins: [view_06468]
  }

  join: view_06470 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06466.category} = ${view_06470.category} ;;
  }

  access_filter: {
    field: view_06466.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06466.is_deleted} = false ;;
}
