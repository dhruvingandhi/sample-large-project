# Explore: explore_3393
# Auto-generated LookML Explore File

include: "/views/domain_30/view_10180.view.lkml"
include: "/views/domain_32/view_10182.view.lkml"
include: "/views/domain_33/view_10183.view.lkml"
include: "/views/domain_34/view_10184.view.lkml"

explore: explore_3393 {
  label: "Explore Explore 3393"
  description: "Comprehensive analytics explore joining base view_10180 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10180
  
  always_filter: {
    filters: [view_10180.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10180.created_at_date: "7 days"]
    unless: [view_10180.id, view_10180.status]
  }

  join: view_10182 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10180.user_id} = ${view_10182.id} ;;
    required_joins: []
  }

  join: view_10183 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10180.account_id} = ${view_10183.account_id} ;;
    required_joins: [view_10182]
  }

  join: view_10184 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10180.category} = ${view_10184.category} ;;
  }

  access_filter: {
    field: view_10180.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10180.is_deleted} = false ;;
}
