# Explore: explore_0628
# Auto-generated LookML Explore File

include: "/views/domain_35/view_01885.view.lkml"
include: "/views/domain_37/view_01887.view.lkml"
include: "/views/domain_38/view_01888.view.lkml"
include: "/views/domain_39/view_01889.view.lkml"

explore: explore_0628 {
  label: "Explore Explore 0628"
  description: "Comprehensive analytics explore joining base view_01885 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01885
  
  always_filter: {
    filters: [view_01885.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01885.created_at_date: "7 days"]
    unless: [view_01885.id, view_01885.status]
  }

  join: view_01887 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01885.user_id} = ${view_01887.id} ;;
    required_joins: []
  }

  join: view_01888 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01885.account_id} = ${view_01888.account_id} ;;
    required_joins: [view_01887]
  }

  join: view_01889 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01885.category} = ${view_01889.category} ;;
  }

  access_filter: {
    field: view_01885.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01885.is_deleted} = false ;;
}
