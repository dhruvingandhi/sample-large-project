# Explore: explore_3576
# Auto-generated LookML Explore File

include: "/views/domain_29/view_10729.view.lkml"
include: "/views/domain_31/view_10731.view.lkml"
include: "/views/domain_32/view_10732.view.lkml"
include: "/views/domain_33/view_10733.view.lkml"

explore: explore_3576 {
  label: "Explore Explore 3576"
  description: "Comprehensive analytics explore joining base view_10729 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10729
  
  always_filter: {
    filters: [view_10729.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10729.created_at_date: "7 days"]
    unless: [view_10729.id, view_10729.status]
  }

  join: view_10731 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10729.user_id} = ${view_10731.id} ;;
    required_joins: []
  }

  join: view_10732 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10729.account_id} = ${view_10732.account_id} ;;
    required_joins: [view_10731]
  }

  join: view_10733 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10729.category} = ${view_10733.category} ;;
  }

  access_filter: {
    field: view_10729.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10729.is_deleted} = false ;;
}
