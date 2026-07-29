# Explore: explore_2962
# Auto-generated LookML Explore File

include: "/views/domain_37/view_08887.view.lkml"
include: "/views/domain_39/view_08889.view.lkml"
include: "/views/domain_40/view_08890.view.lkml"
include: "/views/domain_41/view_08891.view.lkml"

explore: explore_2962 {
  label: "Explore Explore 2962"
  description: "Comprehensive analytics explore joining base view_08887 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08887
  
  always_filter: {
    filters: [view_08887.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08887.created_at_date: "7 days"]
    unless: [view_08887.id, view_08887.status]
  }

  join: view_08889 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08887.user_id} = ${view_08889.id} ;;
    required_joins: []
  }

  join: view_08890 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08887.account_id} = ${view_08890.account_id} ;;
    required_joins: [view_08889]
  }

  join: view_08891 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08887.category} = ${view_08891.category} ;;
  }

  access_filter: {
    field: view_08887.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08887.is_deleted} = false ;;
}
