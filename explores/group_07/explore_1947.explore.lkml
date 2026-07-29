# Explore: explore_1947
# Auto-generated LookML Explore File

include: "/views/domain_42/view_05842.view.lkml"
include: "/views/domain_44/view_05844.view.lkml"
include: "/views/domain_45/view_05845.view.lkml"
include: "/views/domain_46/view_05846.view.lkml"

explore: explore_1947 {
  label: "Explore Explore 1947"
  description: "Comprehensive analytics explore joining base view_05842 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05842
  
  always_filter: {
    filters: [view_05842.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05842.created_at_date: "7 days"]
    unless: [view_05842.id, view_05842.status]
  }

  join: view_05844 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05842.user_id} = ${view_05844.id} ;;
    required_joins: []
  }

  join: view_05845 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05842.account_id} = ${view_05845.account_id} ;;
    required_joins: [view_05844]
  }

  join: view_05846 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05842.category} = ${view_05846.category} ;;
  }

  access_filter: {
    field: view_05842.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05842.is_deleted} = false ;;
}
