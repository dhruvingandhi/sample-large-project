# Explore: explore_2393
# Auto-generated LookML Explore File

include: "/views/domain_30/view_07180.view.lkml"
include: "/views/domain_32/view_07182.view.lkml"
include: "/views/domain_33/view_07183.view.lkml"
include: "/views/domain_34/view_07184.view.lkml"

explore: explore_2393 {
  label: "Explore Explore 2393"
  description: "Comprehensive analytics explore joining base view_07180 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07180
  
  always_filter: {
    filters: [view_07180.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07180.created_at_date: "7 days"]
    unless: [view_07180.id, view_07180.status]
  }

  join: view_07182 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07180.user_id} = ${view_07182.id} ;;
    required_joins: []
  }

  join: view_07183 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07180.account_id} = ${view_07183.account_id} ;;
    required_joins: [view_07182]
  }

  join: view_07184 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07180.category} = ${view_07184.category} ;;
  }

  access_filter: {
    field: view_07180.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07180.is_deleted} = false ;;
}
