# Explore: explore_0547
# Auto-generated LookML Explore File

include: "/views/domain_42/view_01642.view.lkml"
include: "/views/domain_44/view_01644.view.lkml"
include: "/views/domain_45/view_01645.view.lkml"
include: "/views/domain_46/view_01646.view.lkml"

explore: explore_0547 {
  label: "Explore Explore 0547"
  description: "Comprehensive analytics explore joining base view_01642 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01642
  
  always_filter: {
    filters: [view_01642.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01642.created_at_date: "7 days"]
    unless: [view_01642.id, view_01642.status]
  }

  join: view_01644 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01642.user_id} = ${view_01644.id} ;;
    required_joins: []
  }

  join: view_01645 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01642.account_id} = ${view_01645.account_id} ;;
    required_joins: [view_01644]
  }

  join: view_01646 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01642.category} = ${view_01646.category} ;;
  }

  access_filter: {
    field: view_01642.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01642.is_deleted} = false ;;
}
