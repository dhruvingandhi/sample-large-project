# Explore: explore_1362
# Auto-generated LookML Explore File

include: "/views/domain_37/view_04087.view.lkml"
include: "/views/domain_39/view_04089.view.lkml"
include: "/views/domain_40/view_04090.view.lkml"
include: "/views/domain_41/view_04091.view.lkml"

explore: explore_1362 {
  label: "Explore Explore 1362"
  description: "Comprehensive analytics explore joining base view_04087 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04087
  
  always_filter: {
    filters: [view_04087.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04087.created_at_date: "7 days"]
    unless: [view_04087.id, view_04087.status]
  }

  join: view_04089 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04087.user_id} = ${view_04089.id} ;;
    required_joins: []
  }

  join: view_04090 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04087.account_id} = ${view_04090.account_id} ;;
    required_joins: [view_04089]
  }

  join: view_04091 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04087.category} = ${view_04091.category} ;;
  }

  access_filter: {
    field: view_04087.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04087.is_deleted} = false ;;
}
