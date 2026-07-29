# Explore: explore_2352
# Auto-generated LookML Explore File

include: "/views/domain_07/view_07057.view.lkml"
include: "/views/domain_09/view_07059.view.lkml"
include: "/views/domain_10/view_07060.view.lkml"
include: "/views/domain_11/view_07061.view.lkml"

explore: explore_2352 {
  label: "Explore Explore 2352"
  description: "Comprehensive analytics explore joining base view_07057 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07057
  
  always_filter: {
    filters: [view_07057.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07057.created_at_date: "7 days"]
    unless: [view_07057.id, view_07057.status]
  }

  join: view_07059 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07057.user_id} = ${view_07059.id} ;;
    required_joins: []
  }

  join: view_07060 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07057.account_id} = ${view_07060.account_id} ;;
    required_joins: [view_07059]
  }

  join: view_07061 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07057.category} = ${view_07061.category} ;;
  }

  access_filter: {
    field: view_07057.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07057.is_deleted} = false ;;
}
