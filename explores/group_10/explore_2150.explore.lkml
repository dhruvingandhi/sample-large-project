# Update for 2000 file diff target
# Explore: explore_2150
# Auto-generated LookML Explore File

include: "/views/domain_01/view_06451.view.lkml"
include: "/views/domain_03/view_06453.view.lkml"
include: "/views/domain_04/view_06454.view.lkml"
include: "/views/domain_05/view_06455.view.lkml"

explore: explore_2150 {
  label: "Explore Explore 2150"
  description: "Comprehensive analytics explore joining base view_06451 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06451
  
  always_filter: {
    filters: [view_06451.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06451.created_at_date: "7 days"]
    unless: [view_06451.id, view_06451.status]
  }

  join: view_06453 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06451.user_id} = ${view_06453.id} ;;
    required_joins: []
  }

  join: view_06454 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06451.account_id} = ${view_06454.account_id} ;;
    required_joins: [view_06453]
  }

  join: view_06455 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06451.category} = ${view_06455.category} ;;
  }

  access_filter: {
    field: view_06451.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06451.is_deleted} = false ;;
}
