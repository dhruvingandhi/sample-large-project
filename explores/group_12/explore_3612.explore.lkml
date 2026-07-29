# Explore: explore_3612
# Auto-generated LookML Explore File

include: "/views/domain_37/view_10837.view.lkml"
include: "/views/domain_39/view_10839.view.lkml"
include: "/views/domain_40/view_10840.view.lkml"
include: "/views/domain_41/view_10841.view.lkml"

explore: explore_3612 {
  label: "Explore Explore 3612"
  description: "Comprehensive analytics explore joining base view_10837 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10837
  
  always_filter: {
    filters: [view_10837.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10837.created_at_date: "7 days"]
    unless: [view_10837.id, view_10837.status]
  }

  join: view_10839 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10837.user_id} = ${view_10839.id} ;;
    required_joins: []
  }

  join: view_10840 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10837.account_id} = ${view_10840.account_id} ;;
    required_joins: [view_10839]
  }

  join: view_10841 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10837.category} = ${view_10841.category} ;;
  }

  access_filter: {
    field: view_10837.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10837.is_deleted} = false ;;
}
