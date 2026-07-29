# Explore: explore_0668
# Auto-generated LookML Explore File

include: "/views/domain_05/view_02005.view.lkml"
include: "/views/domain_07/view_02007.view.lkml"
include: "/views/domain_08/view_02008.view.lkml"
include: "/views/domain_09/view_02009.view.lkml"

explore: explore_0668 {
  label: "Explore Explore 0668"
  description: "Comprehensive analytics explore joining base view_02005 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02005
  
  always_filter: {
    filters: [view_02005.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02005.created_at_date: "7 days"]
    unless: [view_02005.id, view_02005.status]
  }

  join: view_02007 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02005.user_id} = ${view_02007.id} ;;
    required_joins: []
  }

  join: view_02008 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02005.account_id} = ${view_02008.account_id} ;;
    required_joins: [view_02007]
  }

  join: view_02009 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02005.category} = ${view_02009.category} ;;
  }

  access_filter: {
    field: view_02005.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02005.is_deleted} = false ;;
}
