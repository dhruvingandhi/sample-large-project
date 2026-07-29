# Explore: explore_3691
# Auto-generated LookML Explore File

include: "/views/domain_24/view_11074.view.lkml"
include: "/views/domain_26/view_11076.view.lkml"
include: "/views/domain_27/view_11077.view.lkml"
include: "/views/domain_28/view_11078.view.lkml"

explore: explore_3691 {
  label: "Explore Explore 3691"
  description: "Comprehensive analytics explore joining base view_11074 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11074
  
  always_filter: {
    filters: [view_11074.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11074.created_at_date: "7 days"]
    unless: [view_11074.id, view_11074.status]
  }

  join: view_11076 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11074.user_id} = ${view_11076.id} ;;
    required_joins: []
  }

  join: view_11077 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11074.account_id} = ${view_11077.account_id} ;;
    required_joins: [view_11076]
  }

  join: view_11078 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11074.category} = ${view_11078.category} ;;
  }

  access_filter: {
    field: view_11074.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11074.is_deleted} = false ;;
}
