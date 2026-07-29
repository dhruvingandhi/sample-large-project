# Explore: explore_3412
# Auto-generated LookML Explore File

include: "/views/domain_37/view_10237.view.lkml"
include: "/views/domain_39/view_10239.view.lkml"
include: "/views/domain_40/view_10240.view.lkml"
include: "/views/domain_41/view_10241.view.lkml"

explore: explore_3412 {
  label: "Explore Explore 3412"
  description: "Comprehensive analytics explore joining base view_10237 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_10237
  
  always_filter: {
    filters: [view_10237.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10237.created_at_date: "7 days"]
    unless: [view_10237.id, view_10237.status]
  }

  join: view_10239 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10237.user_id} = ${view_10239.id} ;;
    required_joins: []
  }

  join: view_10240 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10237.account_id} = ${view_10240.account_id} ;;
    required_joins: [view_10239]
  }

  join: view_10241 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10237.category} = ${view_10241.category} ;;
  }

  access_filter: {
    field: view_10237.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10237.is_deleted} = false ;;
}
