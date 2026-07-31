# Update for 2000 file diff target
# Explore: explore_2058
# Auto-generated LookML Explore File

include: "/views/domain_25/view_06175.view.lkml"
include: "/views/domain_27/view_06177.view.lkml"
include: "/views/domain_28/view_06178.view.lkml"
include: "/views/domain_29/view_06179.view.lkml"

explore: explore_2058 {
  label: "Explore Explore 2058"
  description: "Comprehensive analytics explore joining base view_06175 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06175
  
  always_filter: {
    filters: [view_06175.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06175.created_at_date: "7 days"]
    unless: [view_06175.id, view_06175.status]
  }

  join: view_06177 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06175.user_id} = ${view_06177.id} ;;
    required_joins: []
  }

  join: view_06178 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06175.account_id} = ${view_06178.account_id} ;;
    required_joins: [view_06177]
  }

  join: view_06179 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06175.category} = ${view_06179.category} ;;
  }

  access_filter: {
    field: view_06175.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06175.is_deleted} = false ;;
}
