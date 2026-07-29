# Explore: explore_1757
# Auto-generated LookML Explore File

include: "/views/domain_22/view_05272.view.lkml"
include: "/views/domain_24/view_05274.view.lkml"
include: "/views/domain_25/view_05275.view.lkml"
include: "/views/domain_26/view_05276.view.lkml"

explore: explore_1757 {
  label: "Explore Explore 1757"
  description: "Comprehensive analytics explore joining base view_05272 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_05272
  
  always_filter: {
    filters: [view_05272.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05272.created_at_date: "7 days"]
    unless: [view_05272.id, view_05272.status]
  }

  join: view_05274 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05272.user_id} = ${view_05274.id} ;;
    required_joins: []
  }

  join: view_05275 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05272.account_id} = ${view_05275.account_id} ;;
    required_joins: [view_05274]
  }

  join: view_05276 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05272.category} = ${view_05276.category} ;;
  }

  access_filter: {
    field: view_05272.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05272.is_deleted} = false ;;
}
