# Explore: explore_3992
# Auto-generated LookML Explore File

include: "/views/domain_27/view_11977.view.lkml"
include: "/views/domain_29/view_11979.view.lkml"
include: "/views/domain_30/view_11980.view.lkml"
include: "/views/domain_31/view_11981.view.lkml"

explore: explore_3992 {
  label: "Explore Explore 3992"
  description: "Comprehensive analytics explore joining base view_11977 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11977
  
  always_filter: {
    filters: [view_11977.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11977.created_at_date: "7 days"]
    unless: [view_11977.id, view_11977.status]
  }

  join: view_11979 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11977.user_id} = ${view_11979.id} ;;
    required_joins: []
  }

  join: view_11980 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11977.account_id} = ${view_11980.account_id} ;;
    required_joins: [view_11979]
  }

  join: view_11981 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11977.category} = ${view_11981.category} ;;
  }

  access_filter: {
    field: view_11977.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11977.is_deleted} = false ;;
}
