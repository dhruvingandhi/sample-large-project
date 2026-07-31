# Update for 2000 file diff target
# Explore: explore_3750
# Auto-generated LookML Explore File

include: "/views/domain_01/view_11251.view.lkml"
include: "/views/domain_03/view_11253.view.lkml"
include: "/views/domain_04/view_11254.view.lkml"
include: "/views/domain_05/view_11255.view.lkml"

explore: explore_3750 {
  label: "Explore Explore 3750"
  description: "Comprehensive analytics explore joining base view_11251 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11251
  
  always_filter: {
    filters: [view_11251.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11251.created_at_date: "7 days"]
    unless: [view_11251.id, view_11251.status]
  }

  join: view_11253 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11251.user_id} = ${view_11253.id} ;;
    required_joins: []
  }

  join: view_11254 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11251.account_id} = ${view_11254.account_id} ;;
    required_joins: [view_11253]
  }

  join: view_11255 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11251.category} = ${view_11255.category} ;;
  }

  access_filter: {
    field: view_11251.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11251.is_deleted} = false ;;
}
