# Antigravity modified: branch dg-3
# Explore: explore_0725
# Auto-generated LookML Explore File

include: "/views/domain_26/view_02176.view.lkml"
include: "/views/domain_28/view_02178.view.lkml"
include: "/views/domain_29/view_02179.view.lkml"
include: "/views/domain_30/view_02180.view.lkml"

explore: explore_0725 {
  label: "Explore Explore 0725"
  description: "Comprehensive analytics explore joining base view_02176 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02176
  
  always_filter: {
    filters: [view_02176.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02176.created_at_date: "7 days"]
    unless: [view_02176.id, view_02176.status]
  }

  join: view_02178 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02176.user_id} = ${view_02178.id} ;;
    required_joins: []
  }

  join: view_02179 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02176.account_id} = ${view_02179.account_id} ;;
    required_joins: [view_02178]
  }

  join: view_02180 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02176.category} = ${view_02180.category} ;;
  }

  access_filter: {
    field: view_02176.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02176.is_deleted} = false ;;
}
