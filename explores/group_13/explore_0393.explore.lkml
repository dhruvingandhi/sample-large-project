# Explore: explore_0393
# Auto-generated LookML Explore File

include: "/views/domain_30/view_01180.view.lkml"
include: "/views/domain_32/view_01182.view.lkml"
include: "/views/domain_33/view_01183.view.lkml"
include: "/views/domain_34/view_01184.view.lkml"

explore: explore_0393 {
  label: "Explore Explore 0393"
  description: "Comprehensive analytics explore joining base view_01180 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01180
  
  always_filter: {
    filters: [view_01180.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01180.created_at_date: "7 days"]
    unless: [view_01180.id, view_01180.status]
  }

  join: view_01182 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01180.user_id} = ${view_01182.id} ;;
    required_joins: []
  }

  join: view_01183 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01180.account_id} = ${view_01183.account_id} ;;
    required_joins: [view_01182]
  }

  join: view_01184 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01180.category} = ${view_01184.category} ;;
  }

  access_filter: {
    field: view_01180.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01180.is_deleted} = false ;;
}
