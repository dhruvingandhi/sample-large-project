# Explore: explore_3814
# Auto-generated LookML Explore File

include: "/views/domain_43/view_11443.view.lkml"
include: "/views/domain_45/view_11445.view.lkml"
include: "/views/domain_46/view_11446.view.lkml"
include: "/views/domain_47/view_11447.view.lkml"

explore: explore_3814 {
  label: "Explore Explore 3814"
  description: "Comprehensive analytics explore joining base view_11443 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11443
  
  always_filter: {
    filters: [view_11443.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11443.created_at_date: "7 days"]
    unless: [view_11443.id, view_11443.status]
  }

  join: view_11445 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11443.user_id} = ${view_11445.id} ;;
    required_joins: []
  }

  join: view_11446 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11443.account_id} = ${view_11446.account_id} ;;
    required_joins: [view_11445]
  }

  join: view_11447 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11443.category} = ${view_11447.category} ;;
  }

  access_filter: {
    field: view_11443.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11443.is_deleted} = false ;;
}
