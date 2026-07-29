# Explore: explore_2691
# Auto-generated LookML Explore File

include: "/views/domain_24/view_08074.view.lkml"
include: "/views/domain_26/view_08076.view.lkml"
include: "/views/domain_27/view_08077.view.lkml"
include: "/views/domain_28/view_08078.view.lkml"

explore: explore_2691 {
  label: "Explore Explore 2691"
  description: "Comprehensive analytics explore joining base view_08074 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08074
  
  always_filter: {
    filters: [view_08074.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08074.created_at_date: "7 days"]
    unless: [view_08074.id, view_08074.status]
  }

  join: view_08076 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08074.user_id} = ${view_08076.id} ;;
    required_joins: []
  }

  join: view_08077 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08074.account_id} = ${view_08077.account_id} ;;
    required_joins: [view_08076]
  }

  join: view_08078 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08074.category} = ${view_08078.category} ;;
  }

  access_filter: {
    field: view_08074.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08074.is_deleted} = false ;;
}
