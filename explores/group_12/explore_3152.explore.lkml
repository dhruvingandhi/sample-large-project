# Explore: explore_3152
# Auto-generated LookML Explore File

include: "/views/domain_07/view_09457.view.lkml"
include: "/views/domain_09/view_09459.view.lkml"
include: "/views/domain_10/view_09460.view.lkml"
include: "/views/domain_11/view_09461.view.lkml"

explore: explore_3152 {
  label: "Explore Explore 3152"
  description: "Comprehensive analytics explore joining base view_09457 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09457
  
  always_filter: {
    filters: [view_09457.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09457.created_at_date: "7 days"]
    unless: [view_09457.id, view_09457.status]
  }

  join: view_09459 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09457.user_id} = ${view_09459.id} ;;
    required_joins: []
  }

  join: view_09460 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09457.account_id} = ${view_09460.account_id} ;;
    required_joins: [view_09459]
  }

  join: view_09461 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09457.category} = ${view_09461.category} ;;
  }

  access_filter: {
    field: view_09457.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09457.is_deleted} = false ;;
}
