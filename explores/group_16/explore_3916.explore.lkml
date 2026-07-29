# Explore: explore_3916
# Auto-generated LookML Explore File

include: "/views/domain_49/view_11749.view.lkml"
include: "/views/domain_01/view_11751.view.lkml"
include: "/views/domain_02/view_11752.view.lkml"
include: "/views/domain_03/view_11753.view.lkml"

explore: explore_3916 {
  label: "Explore Explore 3916"
  description: "Comprehensive analytics explore joining base view_11749 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11749
  
  always_filter: {
    filters: [view_11749.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11749.created_at_date: "7 days"]
    unless: [view_11749.id, view_11749.status]
  }

  join: view_11751 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11749.user_id} = ${view_11751.id} ;;
    required_joins: []
  }

  join: view_11752 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11749.account_id} = ${view_11752.account_id} ;;
    required_joins: [view_11751]
  }

  join: view_11753 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11749.category} = ${view_11753.category} ;;
  }

  access_filter: {
    field: view_11749.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11749.is_deleted} = false ;;
}
