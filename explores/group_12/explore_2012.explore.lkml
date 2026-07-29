# Explore: explore_2012
# Auto-generated LookML Explore File

include: "/views/domain_37/view_06037.view.lkml"
include: "/views/domain_39/view_06039.view.lkml"
include: "/views/domain_40/view_06040.view.lkml"
include: "/views/domain_41/view_06041.view.lkml"

explore: explore_2012 {
  label: "Explore Explore 2012"
  description: "Comprehensive analytics explore joining base view_06037 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06037
  
  always_filter: {
    filters: [view_06037.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06037.created_at_date: "7 days"]
    unless: [view_06037.id, view_06037.status]
  }

  join: view_06039 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06037.user_id} = ${view_06039.id} ;;
    required_joins: []
  }

  join: view_06040 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06037.account_id} = ${view_06040.account_id} ;;
    required_joins: [view_06039]
  }

  join: view_06041 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06037.category} = ${view_06041.category} ;;
  }

  access_filter: {
    field: view_06037.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06037.is_deleted} = false ;;
}
