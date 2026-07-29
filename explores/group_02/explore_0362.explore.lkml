# Explore: explore_0362
# Auto-generated LookML Explore File

include: "/views/domain_37/view_01087.view.lkml"
include: "/views/domain_39/view_01089.view.lkml"
include: "/views/domain_40/view_01090.view.lkml"
include: "/views/domain_41/view_01091.view.lkml"

explore: explore_0362 {
  label: "Explore Explore 0362"
  description: "Comprehensive analytics explore joining base view_01087 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01087
  
  always_filter: {
    filters: [view_01087.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01087.created_at_date: "7 days"]
    unless: [view_01087.id, view_01087.status]
  }

  join: view_01089 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01087.user_id} = ${view_01089.id} ;;
    required_joins: []
  }

  join: view_01090 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01087.account_id} = ${view_01090.account_id} ;;
    required_joins: [view_01089]
  }

  join: view_01091 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01087.category} = ${view_01091.category} ;;
  }

  access_filter: {
    field: view_01087.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01087.is_deleted} = false ;;
}
