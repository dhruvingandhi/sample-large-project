# Explore: explore_3015
# Auto-generated LookML Explore File

include: "/views/domain_46/view_09046.view.lkml"
include: "/views/domain_48/view_09048.view.lkml"
include: "/views/domain_49/view_09049.view.lkml"
include: "/views/domain_50/view_09050.view.lkml"

explore: explore_3015 {
  label: "Explore Explore 3015"
  description: "Comprehensive analytics explore joining base view_09046 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09046
  
  always_filter: {
    filters: [view_09046.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09046.created_at_date: "7 days"]
    unless: [view_09046.id, view_09046.status]
  }

  join: view_09048 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09046.user_id} = ${view_09048.id} ;;
    required_joins: []
  }

  join: view_09049 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09046.account_id} = ${view_09049.account_id} ;;
    required_joins: [view_09048]
  }

  join: view_09050 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09046.category} = ${view_09050.category} ;;
  }

  access_filter: {
    field: view_09046.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09046.is_deleted} = false ;;
}
