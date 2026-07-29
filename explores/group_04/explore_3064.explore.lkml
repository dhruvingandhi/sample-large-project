# Explore: explore_3064
# Auto-generated LookML Explore File

include: "/views/domain_43/view_09193.view.lkml"
include: "/views/domain_45/view_09195.view.lkml"
include: "/views/domain_46/view_09196.view.lkml"
include: "/views/domain_47/view_09197.view.lkml"

explore: explore_3064 {
  label: "Explore Explore 3064"
  description: "Comprehensive analytics explore joining base view_09193 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09193
  
  always_filter: {
    filters: [view_09193.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09193.created_at_date: "7 days"]
    unless: [view_09193.id, view_09193.status]
  }

  join: view_09195 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09193.user_id} = ${view_09195.id} ;;
    required_joins: []
  }

  join: view_09196 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09193.account_id} = ${view_09196.account_id} ;;
    required_joins: [view_09195]
  }

  join: view_09197 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09193.category} = ${view_09197.category} ;;
  }

  access_filter: {
    field: view_09193.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09193.is_deleted} = false ;;
}
