# Explore: explore_3592
# Auto-generated LookML Explore File

include: "/views/domain_27/view_10777.view.lkml"
include: "/views/domain_29/view_10779.view.lkml"
include: "/views/domain_30/view_10780.view.lkml"
include: "/views/domain_31/view_10781.view.lkml"

explore: explore_3592 {
  label: "Explore Explore 3592"
  description: "Comprehensive analytics explore joining base view_10777 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10777
  
  always_filter: {
    filters: [view_10777.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10777.created_at_date: "7 days"]
    unless: [view_10777.id, view_10777.status]
  }

  join: view_10779 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10777.user_id} = ${view_10779.id} ;;
    required_joins: []
  }

  join: view_10780 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10777.account_id} = ${view_10780.account_id} ;;
    required_joins: [view_10779]
  }

  join: view_10781 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10777.category} = ${view_10781.category} ;;
  }

  access_filter: {
    field: view_10777.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10777.is_deleted} = false ;;
}
