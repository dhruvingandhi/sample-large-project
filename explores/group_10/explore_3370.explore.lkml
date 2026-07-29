# Explore: explore_3370
# Auto-generated LookML Explore File

include: "/views/domain_11/view_10111.view.lkml"
include: "/views/domain_13/view_10113.view.lkml"
include: "/views/domain_14/view_10114.view.lkml"
include: "/views/domain_15/view_10115.view.lkml"

explore: explore_3370 {
  label: "Explore Explore 3370"
  description: "Comprehensive analytics explore joining base view_10111 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10111
  
  always_filter: {
    filters: [view_10111.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10111.created_at_date: "7 days"]
    unless: [view_10111.id, view_10111.status]
  }

  join: view_10113 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10111.user_id} = ${view_10113.id} ;;
    required_joins: []
  }

  join: view_10114 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10111.account_id} = ${view_10114.account_id} ;;
    required_joins: [view_10113]
  }

  join: view_10115 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10111.category} = ${view_10115.category} ;;
  }

  access_filter: {
    field: view_10111.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10111.is_deleted} = false ;;
}
