# Update for 2000 file diff target
# Explore: explore_3199
# Auto-generated LookML Explore File

include: "/views/domain_48/view_09598.view.lkml"
include: "/views/domain_50/view_09600.view.lkml"
include: "/views/domain_01/view_09601.view.lkml"
include: "/views/domain_02/view_09602.view.lkml"

explore: explore_3199 {
  label: "Explore Explore 3199"
  description: "Comprehensive analytics explore joining base view_09598 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09598
  
  always_filter: {
    filters: [view_09598.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09598.created_at_date: "7 days"]
    unless: [view_09598.id, view_09598.status]
  }

  join: view_09600 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09598.user_id} = ${view_09600.id} ;;
    required_joins: []
  }

  join: view_09601 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09598.account_id} = ${view_09601.account_id} ;;
    required_joins: [view_09600]
  }

  join: view_09602 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09598.category} = ${view_09602.category} ;;
  }

  access_filter: {
    field: view_09598.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09598.is_deleted} = false ;;
}
