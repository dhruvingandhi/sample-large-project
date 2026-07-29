# Explore: explore_3817
# Auto-generated LookML Explore File

include: "/views/domain_02/view_11452.view.lkml"
include: "/views/domain_04/view_11454.view.lkml"
include: "/views/domain_05/view_11455.view.lkml"
include: "/views/domain_06/view_11456.view.lkml"

explore: explore_3817 {
  label: "Explore Explore 3817"
  description: "Comprehensive analytics explore joining base view_11452 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11452
  
  always_filter: {
    filters: [view_11452.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11452.created_at_date: "7 days"]
    unless: [view_11452.id, view_11452.status]
  }

  join: view_11454 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11452.user_id} = ${view_11454.id} ;;
    required_joins: []
  }

  join: view_11455 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11452.account_id} = ${view_11455.account_id} ;;
    required_joins: [view_11454]
  }

  join: view_11456 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11452.category} = ${view_11456.category} ;;
  }

  access_filter: {
    field: view_11452.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11452.is_deleted} = false ;;
}
