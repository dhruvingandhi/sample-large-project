# Explore: explore_3408
# Auto-generated LookML Explore File

include: "/views/domain_25/view_10225.view.lkml"
include: "/views/domain_27/view_10227.view.lkml"
include: "/views/domain_28/view_10228.view.lkml"
include: "/views/domain_29/view_10229.view.lkml"

explore: explore_3408 {
  label: "Explore Explore 3408"
  description: "Comprehensive analytics explore joining base view_10225 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10225
  
  always_filter: {
    filters: [view_10225.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10225.created_at_date: "7 days"]
    unless: [view_10225.id, view_10225.status]
  }

  join: view_10227 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10225.user_id} = ${view_10227.id} ;;
    required_joins: []
  }

  join: view_10228 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10225.account_id} = ${view_10228.account_id} ;;
    required_joins: [view_10227]
  }

  join: view_10229 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10225.category} = ${view_10229.category} ;;
  }

  access_filter: {
    field: view_10225.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10225.is_deleted} = false ;;
}
