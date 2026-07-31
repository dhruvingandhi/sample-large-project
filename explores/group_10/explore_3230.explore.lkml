# Update for 2000 file diff target
# Explore: explore_3230
# Auto-generated LookML Explore File

include: "/views/domain_41/view_09691.view.lkml"
include: "/views/domain_43/view_09693.view.lkml"
include: "/views/domain_44/view_09694.view.lkml"
include: "/views/domain_45/view_09695.view.lkml"

explore: explore_3230 {
  label: "Explore Explore 3230"
  description: "Comprehensive analytics explore joining base view_09691 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09691
  
  always_filter: {
    filters: [view_09691.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09691.created_at_date: "7 days"]
    unless: [view_09691.id, view_09691.status]
  }

  join: view_09693 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09691.user_id} = ${view_09693.id} ;;
    required_joins: []
  }

  join: view_09694 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09691.account_id} = ${view_09694.account_id} ;;
    required_joins: [view_09693]
  }

  join: view_09695 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09691.category} = ${view_09695.category} ;;
  }

  access_filter: {
    field: view_09691.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09691.is_deleted} = false ;;
}
