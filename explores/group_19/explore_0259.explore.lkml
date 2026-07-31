# Update for 2000 file diff target
# Explore: explore_0259
# Auto-generated LookML Explore File

include: "/views/domain_28/view_00778.view.lkml"
include: "/views/domain_30/view_00780.view.lkml"
include: "/views/domain_31/view_00781.view.lkml"
include: "/views/domain_32/view_00782.view.lkml"

explore: explore_0259 {
  label: "Explore Explore 0259"
  description: "Comprehensive analytics explore joining base view_00778 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00778
  
  always_filter: {
    filters: [view_00778.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00778.created_at_date: "7 days"]
    unless: [view_00778.id, view_00778.status]
  }

  join: view_00780 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00778.user_id} = ${view_00780.id} ;;
    required_joins: []
  }

  join: view_00781 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00778.account_id} = ${view_00781.account_id} ;;
    required_joins: [view_00780]
  }

  join: view_00782 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00778.category} = ${view_00782.category} ;;
  }

  access_filter: {
    field: view_00778.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00778.is_deleted} = false ;;
}
