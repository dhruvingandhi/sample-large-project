# Explore: explore_1829
# Auto-generated LookML Explore File

include: "/views/domain_38/view_05488.view.lkml"
include: "/views/domain_40/view_05490.view.lkml"
include: "/views/domain_41/view_05491.view.lkml"
include: "/views/domain_42/view_05492.view.lkml"

explore: explore_1829 {
  label: "Explore Explore 1829"
  description: "Comprehensive analytics explore joining base view_05488 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05488
  
  always_filter: {
    filters: [view_05488.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05488.created_at_date: "7 days"]
    unless: [view_05488.id, view_05488.status]
  }

  join: view_05490 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05488.user_id} = ${view_05490.id} ;;
    required_joins: []
  }

  join: view_05491 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05488.account_id} = ${view_05491.account_id} ;;
    required_joins: [view_05490]
  }

  join: view_05492 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05488.category} = ${view_05492.category} ;;
  }

  access_filter: {
    field: view_05488.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05488.is_deleted} = false ;;
}
