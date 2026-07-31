# Update for 2000 file diff target
# Explore: explore_3677
# Auto-generated LookML Explore File

include: "/views/domain_32/view_11032.view.lkml"
include: "/views/domain_34/view_11034.view.lkml"
include: "/views/domain_35/view_11035.view.lkml"
include: "/views/domain_36/view_11036.view.lkml"

explore: explore_3677 {
  label: "Explore Explore 3677"
  description: "Comprehensive analytics explore joining base view_11032 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11032
  
  always_filter: {
    filters: [view_11032.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11032.created_at_date: "7 days"]
    unless: [view_11032.id, view_11032.status]
  }

  join: view_11034 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11032.user_id} = ${view_11034.id} ;;
    required_joins: []
  }

  join: view_11035 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11032.account_id} = ${view_11035.account_id} ;;
    required_joins: [view_11034]
  }

  join: view_11036 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11032.category} = ${view_11036.category} ;;
  }

  access_filter: {
    field: view_11032.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11032.is_deleted} = false ;;
}
