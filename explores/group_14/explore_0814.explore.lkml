# Explore: explore_0814
# Auto-generated LookML Explore File

include: "/views/domain_43/view_02443.view.lkml"
include: "/views/domain_45/view_02445.view.lkml"
include: "/views/domain_46/view_02446.view.lkml"
include: "/views/domain_47/view_02447.view.lkml"

explore: explore_0814 {
  label: "Explore Explore 0814"
  description: "Comprehensive analytics explore joining base view_02443 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02443
  
  always_filter: {
    filters: [view_02443.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02443.created_at_date: "7 days"]
    unless: [view_02443.id, view_02443.status]
  }

  join: view_02445 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02443.user_id} = ${view_02445.id} ;;
    required_joins: []
  }

  join: view_02446 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02443.account_id} = ${view_02446.account_id} ;;
    required_joins: [view_02445]
  }

  join: view_02447 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02443.category} = ${view_02447.category} ;;
  }

  access_filter: {
    field: view_02443.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02443.is_deleted} = false ;;
}
