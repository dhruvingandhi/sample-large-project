# Explore: explore_2009
# Auto-generated LookML Explore File

include: "/views/domain_28/view_06028.view.lkml"
include: "/views/domain_30/view_06030.view.lkml"
include: "/views/domain_31/view_06031.view.lkml"
include: "/views/domain_32/view_06032.view.lkml"

explore: explore_2009 {
  label: "Explore Explore 2009"
  description: "Comprehensive analytics explore joining base view_06028 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06028
  
  always_filter: {
    filters: [view_06028.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06028.created_at_date: "7 days"]
    unless: [view_06028.id, view_06028.status]
  }

  join: view_06030 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06028.user_id} = ${view_06030.id} ;;
    required_joins: []
  }

  join: view_06031 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06028.account_id} = ${view_06031.account_id} ;;
    required_joins: [view_06030]
  }

  join: view_06032 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06028.category} = ${view_06032.category} ;;
  }

  access_filter: {
    field: view_06028.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06028.is_deleted} = false ;;
}
