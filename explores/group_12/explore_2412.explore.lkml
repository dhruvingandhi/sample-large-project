# Explore: explore_2412
# Auto-generated LookML Explore File

include: "/views/domain_37/view_07237.view.lkml"
include: "/views/domain_39/view_07239.view.lkml"
include: "/views/domain_40/view_07240.view.lkml"
include: "/views/domain_41/view_07241.view.lkml"

explore: explore_2412 {
  label: "Explore Explore 2412"
  description: "Comprehensive analytics explore joining base view_07237 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07237
  
  always_filter: {
    filters: [view_07237.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07237.created_at_date: "7 days"]
    unless: [view_07237.id, view_07237.status]
  }

  join: view_07239 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07237.user_id} = ${view_07239.id} ;;
    required_joins: []
  }

  join: view_07240 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07237.account_id} = ${view_07240.account_id} ;;
    required_joins: [view_07239]
  }

  join: view_07241 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07237.category} = ${view_07241.category} ;;
  }

  access_filter: {
    field: view_07237.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07237.is_deleted} = false ;;
}
