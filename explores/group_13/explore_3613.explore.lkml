# Explore: explore_3613
# Auto-generated LookML Explore File

include: "/views/domain_40/view_10840.view.lkml"
include: "/views/domain_42/view_10842.view.lkml"
include: "/views/domain_43/view_10843.view.lkml"
include: "/views/domain_44/view_10844.view.lkml"

explore: explore_3613 {
  label: "Explore Explore 3613"
  description: "Comprehensive analytics explore joining base view_10840 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10840
  
  always_filter: {
    filters: [view_10840.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10840.created_at_date: "7 days"]
    unless: [view_10840.id, view_10840.status]
  }

  join: view_10842 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10840.user_id} = ${view_10842.id} ;;
    required_joins: []
  }

  join: view_10843 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10840.account_id} = ${view_10843.account_id} ;;
    required_joins: [view_10842]
  }

  join: view_10844 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10840.category} = ${view_10844.category} ;;
  }

  access_filter: {
    field: view_10840.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10840.is_deleted} = false ;;
}
