# Explore: explore_2756
# Auto-generated LookML Explore File

include: "/views/domain_19/view_08269.view.lkml"
include: "/views/domain_21/view_08271.view.lkml"
include: "/views/domain_22/view_08272.view.lkml"
include: "/views/domain_23/view_08273.view.lkml"

explore: explore_2756 {
  label: "Explore Explore 2756"
  description: "Comprehensive analytics explore joining base view_08269 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08269
  
  always_filter: {
    filters: [view_08269.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08269.created_at_date: "7 days"]
    unless: [view_08269.id, view_08269.status]
  }

  join: view_08271 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08269.user_id} = ${view_08271.id} ;;
    required_joins: []
  }

  join: view_08272 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08269.account_id} = ${view_08272.account_id} ;;
    required_joins: [view_08271]
  }

  join: view_08273 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08269.category} = ${view_08273.category} ;;
  }

  access_filter: {
    field: view_08269.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08269.is_deleted} = false ;;
}
