# Update for 500 file diff target
# Explore: explore_1582
# Auto-generated LookML Explore File

include: "/views/domain_47/view_04747.view.lkml"
include: "/views/domain_49/view_04749.view.lkml"
include: "/views/domain_50/view_04750.view.lkml"
include: "/views/domain_01/view_04751.view.lkml"

explore: explore_1582 {
  label: "Explore Explore 1582"
  description: "Comprehensive analytics explore joining base view_04747 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04747
  
  always_filter: {
    filters: [view_04747.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04747.created_at_date: "7 days"]
    unless: [view_04747.id, view_04747.status]
  }

  join: view_04749 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04747.user_id} = ${view_04749.id} ;;
    required_joins: []
  }

  join: view_04750 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04747.account_id} = ${view_04750.account_id} ;;
    required_joins: [view_04749]
  }

  join: view_04751 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04747.category} = ${view_04751.category} ;;
  }

  access_filter: {
    field: view_04747.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04747.is_deleted} = false ;;
}
