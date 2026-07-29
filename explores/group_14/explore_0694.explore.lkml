# Explore: explore_0694
# Auto-generated LookML Explore File

include: "/views/domain_33/view_02083.view.lkml"
include: "/views/domain_35/view_02085.view.lkml"
include: "/views/domain_36/view_02086.view.lkml"
include: "/views/domain_37/view_02087.view.lkml"

explore: explore_0694 {
  label: "Explore Explore 0694"
  description: "Comprehensive analytics explore joining base view_02083 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02083
  
  always_filter: {
    filters: [view_02083.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02083.created_at_date: "7 days"]
    unless: [view_02083.id, view_02083.status]
  }

  join: view_02085 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02083.user_id} = ${view_02085.id} ;;
    required_joins: []
  }

  join: view_02086 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02083.account_id} = ${view_02086.account_id} ;;
    required_joins: [view_02085]
  }

  join: view_02087 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02083.category} = ${view_02087.category} ;;
  }

  access_filter: {
    field: view_02083.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02083.is_deleted} = false ;;
}
