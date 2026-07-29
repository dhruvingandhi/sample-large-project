# Explore: explore_1354
# Auto-generated LookML Explore File

include: "/views/domain_13/view_04063.view.lkml"
include: "/views/domain_15/view_04065.view.lkml"
include: "/views/domain_16/view_04066.view.lkml"
include: "/views/domain_17/view_04067.view.lkml"

explore: explore_1354 {
  label: "Explore Explore 1354"
  description: "Comprehensive analytics explore joining base view_04063 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04063
  
  always_filter: {
    filters: [view_04063.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04063.created_at_date: "7 days"]
    unless: [view_04063.id, view_04063.status]
  }

  join: view_04065 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04063.user_id} = ${view_04065.id} ;;
    required_joins: []
  }

  join: view_04066 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04063.account_id} = ${view_04066.account_id} ;;
    required_joins: [view_04065]
  }

  join: view_04067 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04063.category} = ${view_04067.category} ;;
  }

  access_filter: {
    field: view_04063.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04063.is_deleted} = false ;;
}
