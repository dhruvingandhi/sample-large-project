# Explore: explore_3732
# Auto-generated LookML Explore File

include: "/views/domain_47/view_11197.view.lkml"
include: "/views/domain_49/view_11199.view.lkml"
include: "/views/domain_50/view_11200.view.lkml"
include: "/views/domain_01/view_11201.view.lkml"

explore: explore_3732 {
  label: "Explore Explore 3732"
  description: "Comprehensive analytics explore joining base view_11197 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11197
  
  always_filter: {
    filters: [view_11197.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11197.created_at_date: "7 days"]
    unless: [view_11197.id, view_11197.status]
  }

  join: view_11199 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11197.user_id} = ${view_11199.id} ;;
    required_joins: []
  }

  join: view_11200 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11197.account_id} = ${view_11200.account_id} ;;
    required_joins: [view_11199]
  }

  join: view_11201 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11197.category} = ${view_11201.category} ;;
  }

  access_filter: {
    field: view_11197.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11197.is_deleted} = false ;;
}
