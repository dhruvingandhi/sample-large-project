# Explore: explore_3628
# Auto-generated LookML Explore File

include: "/views/domain_35/view_10885.view.lkml"
include: "/views/domain_37/view_10887.view.lkml"
include: "/views/domain_38/view_10888.view.lkml"
include: "/views/domain_39/view_10889.view.lkml"

explore: explore_3628 {
  label: "Explore Explore 3628"
  description: "Comprehensive analytics explore joining base view_10885 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10885
  
  always_filter: {
    filters: [view_10885.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10885.created_at_date: "7 days"]
    unless: [view_10885.id, view_10885.status]
  }

  join: view_10887 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10885.user_id} = ${view_10887.id} ;;
    required_joins: []
  }

  join: view_10888 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10885.account_id} = ${view_10888.account_id} ;;
    required_joins: [view_10887]
  }

  join: view_10889 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10885.category} = ${view_10889.category} ;;
  }

  access_filter: {
    field: view_10885.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10885.is_deleted} = false ;;
}
