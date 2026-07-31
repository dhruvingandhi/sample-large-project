# Update for 2000 file diff target
# Explore: explore_3800
# Auto-generated LookML Explore File

include: "/views/domain_01/view_11401.view.lkml"
include: "/views/domain_03/view_11403.view.lkml"
include: "/views/domain_04/view_11404.view.lkml"
include: "/views/domain_05/view_11405.view.lkml"

explore: explore_3800 {
  label: "Explore Explore 3800"
  description: "Comprehensive analytics explore joining base view_11401 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11401
  
  always_filter: {
    filters: [view_11401.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11401.created_at_date: "7 days"]
    unless: [view_11401.id, view_11401.status]
  }

  join: view_11403 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11401.user_id} = ${view_11403.id} ;;
    required_joins: []
  }

  join: view_11404 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11401.account_id} = ${view_11404.account_id} ;;
    required_joins: [view_11403]
  }

  join: view_11405 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11401.category} = ${view_11405.category} ;;
  }

  access_filter: {
    field: view_11401.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11401.is_deleted} = false ;;
}
