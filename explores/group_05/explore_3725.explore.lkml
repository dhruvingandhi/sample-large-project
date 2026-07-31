# Update for 500 file diff target
# Explore: explore_3725
# Auto-generated LookML Explore File

include: "/views/domain_26/view_11176.view.lkml"
include: "/views/domain_28/view_11178.view.lkml"
include: "/views/domain_29/view_11179.view.lkml"
include: "/views/domain_30/view_11180.view.lkml"

explore: explore_3725 {
  label: "Explore Explore 3725"
  description: "Comprehensive analytics explore joining base view_11176 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11176
  
  always_filter: {
    filters: [view_11176.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11176.created_at_date: "7 days"]
    unless: [view_11176.id, view_11176.status]
  }

  join: view_11178 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11176.user_id} = ${view_11178.id} ;;
    required_joins: []
  }

  join: view_11179 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11176.account_id} = ${view_11179.account_id} ;;
    required_joins: [view_11178]
  }

  join: view_11180 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11176.category} = ${view_11180.category} ;;
  }

  access_filter: {
    field: view_11176.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11176.is_deleted} = false ;;
}
