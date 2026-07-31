# Update for 500 file diff target
# Explore: explore_1862
# Auto-generated LookML Explore File

include: "/views/domain_37/view_05587.view.lkml"
include: "/views/domain_39/view_05589.view.lkml"
include: "/views/domain_40/view_05590.view.lkml"
include: "/views/domain_41/view_05591.view.lkml"

explore: explore_1862 {
  label: "Explore Explore 1862"
  description: "Comprehensive analytics explore joining base view_05587 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05587
  
  always_filter: {
    filters: [view_05587.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05587.created_at_date: "7 days"]
    unless: [view_05587.id, view_05587.status]
  }

  join: view_05589 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05587.user_id} = ${view_05589.id} ;;
    required_joins: []
  }

  join: view_05590 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05587.account_id} = ${view_05590.account_id} ;;
    required_joins: [view_05589]
  }

  join: view_05591 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05587.category} = ${view_05591.category} ;;
  }

  access_filter: {
    field: view_05587.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05587.is_deleted} = false ;;
}
