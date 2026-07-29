# Explore: explore_3863
# Auto-generated LookML Explore File

include: "/views/domain_40/view_11590.view.lkml"
include: "/views/domain_42/view_11592.view.lkml"
include: "/views/domain_43/view_11593.view.lkml"
include: "/views/domain_44/view_11594.view.lkml"

explore: explore_3863 {
  label: "Explore Explore 3863"
  description: "Comprehensive analytics explore joining base view_11590 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_11590
  
  always_filter: {
    filters: [view_11590.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11590.created_at_date: "7 days"]
    unless: [view_11590.id, view_11590.status]
  }

  join: view_11592 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11590.user_id} = ${view_11592.id} ;;
    required_joins: []
  }

  join: view_11593 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11590.account_id} = ${view_11593.account_id} ;;
    required_joins: [view_11592]
  }

  join: view_11594 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11590.category} = ${view_11594.category} ;;
  }

  access_filter: {
    field: view_11590.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11590.is_deleted} = false ;;
}
