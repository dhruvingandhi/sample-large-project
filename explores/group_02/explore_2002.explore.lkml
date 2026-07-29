# Explore: explore_2002
# Auto-generated LookML Explore File

include: "/views/domain_07/view_06007.view.lkml"
include: "/views/domain_09/view_06009.view.lkml"
include: "/views/domain_10/view_06010.view.lkml"
include: "/views/domain_11/view_06011.view.lkml"

explore: explore_2002 {
  label: "Explore Explore 2002"
  description: "Comprehensive analytics explore joining base view_06007 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06007
  
  always_filter: {
    filters: [view_06007.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06007.created_at_date: "7 days"]
    unless: [view_06007.id, view_06007.status]
  }

  join: view_06009 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06007.user_id} = ${view_06009.id} ;;
    required_joins: []
  }

  join: view_06010 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06007.account_id} = ${view_06010.account_id} ;;
    required_joins: [view_06009]
  }

  join: view_06011 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06007.category} = ${view_06011.category} ;;
  }

  access_filter: {
    field: view_06007.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06007.is_deleted} = false ;;
}
