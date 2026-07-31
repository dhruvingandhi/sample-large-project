# Update for 2000 file diff target
# Explore: explore_3740
# Auto-generated LookML Explore File

include: "/views/domain_21/view_11221.view.lkml"
include: "/views/domain_23/view_11223.view.lkml"
include: "/views/domain_24/view_11224.view.lkml"
include: "/views/domain_25/view_11225.view.lkml"

explore: explore_3740 {
  label: "Explore Explore 3740"
  description: "Comprehensive analytics explore joining base view_11221 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11221
  
  always_filter: {
    filters: [view_11221.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11221.created_at_date: "7 days"]
    unless: [view_11221.id, view_11221.status]
  }

  join: view_11223 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11221.user_id} = ${view_11223.id} ;;
    required_joins: []
  }

  join: view_11224 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11221.account_id} = ${view_11224.account_id} ;;
    required_joins: [view_11223]
  }

  join: view_11225 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11221.category} = ${view_11225.category} ;;
  }

  access_filter: {
    field: view_11221.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11221.is_deleted} = false ;;
}
