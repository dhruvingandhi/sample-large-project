# Explore: explore_3362
# Auto-generated LookML Explore File

include: "/views/domain_37/view_10087.view.lkml"
include: "/views/domain_39/view_10089.view.lkml"
include: "/views/domain_40/view_10090.view.lkml"
include: "/views/domain_41/view_10091.view.lkml"

explore: explore_3362 {
  label: "Explore Explore 3362"
  description: "Comprehensive analytics explore joining base view_10087 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10087
  
  always_filter: {
    filters: [view_10087.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10087.created_at_date: "7 days"]
    unless: [view_10087.id, view_10087.status]
  }

  join: view_10089 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10087.user_id} = ${view_10089.id} ;;
    required_joins: []
  }

  join: view_10090 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10087.account_id} = ${view_10090.account_id} ;;
    required_joins: [view_10089]
  }

  join: view_10091 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10087.category} = ${view_10091.category} ;;
  }

  access_filter: {
    field: view_10087.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10087.is_deleted} = false ;;
}
