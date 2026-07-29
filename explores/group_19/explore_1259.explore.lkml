# Explore: explore_1259
# Auto-generated LookML Explore File

include: "/views/domain_28/view_03778.view.lkml"
include: "/views/domain_30/view_03780.view.lkml"
include: "/views/domain_31/view_03781.view.lkml"
include: "/views/domain_32/view_03782.view.lkml"

explore: explore_1259 {
  label: "Explore Explore 1259"
  description: "Comprehensive analytics explore joining base view_03778 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03778
  
  always_filter: {
    filters: [view_03778.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03778.created_at_date: "7 days"]
    unless: [view_03778.id, view_03778.status]
  }

  join: view_03780 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03778.user_id} = ${view_03780.id} ;;
    required_joins: []
  }

  join: view_03781 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03778.account_id} = ${view_03781.account_id} ;;
    required_joins: [view_03780]
  }

  join: view_03782 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03778.category} = ${view_03782.category} ;;
  }

  access_filter: {
    field: view_03778.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03778.is_deleted} = false ;;
}
