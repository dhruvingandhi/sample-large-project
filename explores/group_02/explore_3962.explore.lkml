# Explore: explore_3962
# Auto-generated LookML Explore File

include: "/views/domain_37/view_11887.view.lkml"
include: "/views/domain_39/view_11889.view.lkml"
include: "/views/domain_40/view_11890.view.lkml"
include: "/views/domain_41/view_11891.view.lkml"

explore: explore_3962 {
  label: "Explore Explore 3962"
  description: "Comprehensive analytics explore joining base view_11887 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11887
  
  always_filter: {
    filters: [view_11887.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11887.created_at_date: "7 days"]
    unless: [view_11887.id, view_11887.status]
  }

  join: view_11889 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11887.user_id} = ${view_11889.id} ;;
    required_joins: []
  }

  join: view_11890 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11887.account_id} = ${view_11890.account_id} ;;
    required_joins: [view_11889]
  }

  join: view_11891 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11887.category} = ${view_11891.category} ;;
  }

  access_filter: {
    field: view_11887.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11887.is_deleted} = false ;;
}
