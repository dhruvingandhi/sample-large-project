# Explore: explore_0732
# Auto-generated LookML Explore File

include: "/views/domain_47/view_02197.view.lkml"
include: "/views/domain_49/view_02199.view.lkml"
include: "/views/domain_50/view_02200.view.lkml"
include: "/views/domain_01/view_02201.view.lkml"

explore: explore_0732 {
  label: "Explore Explore 0732"
  description: "Comprehensive analytics explore joining base view_02197 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02197
  
  always_filter: {
    filters: [view_02197.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02197.created_at_date: "7 days"]
    unless: [view_02197.id, view_02197.status]
  }

  join: view_02199 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02197.user_id} = ${view_02199.id} ;;
    required_joins: []
  }

  join: view_02200 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02197.account_id} = ${view_02200.account_id} ;;
    required_joins: [view_02199]
  }

  join: view_02201 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02197.category} = ${view_02201.category} ;;
  }

  access_filter: {
    field: view_02197.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02197.is_deleted} = false ;;
}
